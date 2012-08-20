MIME-Version: 1.0
In-Reply-To: <20120819120804.15c33931@pixies.home.jungo.com>
References: <1345214124-5478-1-git-send-email-richard.genoud@gmail.com>
 <1345214124-5478-6-git-send-email-richard.genoud@gmail.com>
 <20120819120804.15c33931@pixies.home.jungo.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 08:31:39 +0200
Message-ID: <CACQ1gAgLirwiwiUOoL7ig7R_RpB8xDr2-g2gVOEUZNvAHB60pQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] UBI: check max_beb_per1024 value in ubi_attach_mtd_dev
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shmulik,

2012/8/19 Shmulik Ladkani <shmulik.ladkani@gmail.com>:
> Hi Richard,
>
> On Fri, 17 Aug 2012 16:35:21 +0200 Richard Genoud <richard.genoud@gmail.com> wrote:
>> +     /*
>> +      * A value of 0 is forced to the default value to keep the same
>> +      * behavior between ubiattach command and module parameter
>> +      */
>
> Minor thing.
>
> Since the module parameter is not yet introduced (only in a later
> patch), and since last part of sentence isn't that important, I would
> simply state:
>
> +        * Use the default if max_beb_per1024 isn't provided.
>
That's right, I'll correct that in next version.
Thanks !
