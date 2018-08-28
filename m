Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fufcP-000254-Av
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 15:09:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id a108-v6so1907898wrc.13
 for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2018 08:09:11 -0700 (PDT)
Subject: Re: [PATCH v2 01/29] nvmem: add support for cell lookups
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-doc <linux-doc@vger.kernel.org>,
 Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, linux-i2c <linux-i2c@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@kernel.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Marek Vasut <marek.vasut@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 David Lechner <david@lechnology.com>, Arnd Bergmann <arnd@arndb.de>,
 Sven Van Asbroeck <svendev@arcx.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lukas Wunner <lukas@wunner.de>, Naren <naren.kernel@gmail.com>,
 netdev <netdev@vger.kernel.org>, Alban Bedel <albeu@free.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, "David S . Miller"
 <davem@davemloft.net>
References: <20180810080526.27207-1-brgl@bgdev.pl>
 <20180810080526.27207-2-brgl@bgdev.pl> <20180824170848.29594318@bbrezillon>
 <20180824152740.GD27483@lunn.ch> <20180825082722.567e8c9a@bbrezillon>
 <CAMRc=Men-MPk5DGshWcVEc0v=gH2WSpx1j-CawOeydwp59tejw@mail.gmail.com>
 <20180827110055.122988d0@bbrezillon>
 <CAMRc=MfpZJUEAhM4OoLbmJcnX3rTJk8fvdiL6=9BjNkVcsf=SA@mail.gmail.com>
 <8cb75723-dc87-f127-2aab-54dd0b08eee8@linaro.org>
 <CAMRc=Mex5WAm8uiV4T=0+bLduBBdj18iekuYT55W9gA_rzQ_sg@mail.gmail.com>
 <916e3e89-82b3-0d52-2b77-4374261a9d0f@linaro.org>
 <CAMRc=MeALxpyBQhWxGPt9BubO_ZwKGih1d8zhRzFYZ0+3kHFAA@mail.gmail.com>
 <20180828165309.0594ae13@bbrezillon>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <af94be21-328b-d6a2-2024-67b98860c3d5@linaro.org>
Date: Tue, 28 Aug 2018 16:09:07 +0100
MIME-Version: 1.0
In-Reply-To: <20180828165309.0594ae13@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 28/08/18 15:53, Boris Brezillon wrote:
> On Tue, 28 Aug 2018 16:41:04 +0200
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 

...
> 
>>>
>>>   static struct nvmem_cell *nvmem_find_cell(const char *cell_id)
> 
> Can we get rid of this function and just have the the version that
> takes an nvmem_name and a cell_id.

That should be feasible!


>>>>>
>>>>> I hope you got the reason why of_nvmem_cell_get() always allocates new
>>>>> instance for every get!!
>>>>
>>>>
>>>>
>>>> I admit I didn't test it, but just from reading the code it seems like
>>>> in nvmem_cell_get() for DT-users we'll always get to
>>>> of_nvmem_cell_get() and in there we always end up calling line 873:
>>>> cell = kzalloc(sizeof(*cell), GFP_KERNEL);
>>>>   
>>> That is correct, this cell is created when we do a get and release when we
>>> do a put().
>>>   
>>
>> Shouldn't we add the cell to the list, and check first if it's there
>> and only create it if not?
> 
> Or even better: create the cells at registration time so that the
> search code is the same for both DT and non-DT cases. Only the
> registration would differ (with one path parsing the DT, and the other
> one searching for nvmem cells defined with a nvmem-provider-lookup
> table).
Makes sense! and that would go very well with the plan of "nvmem-cell" 
compatible for cells!.
> 
