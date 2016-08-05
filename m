Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVdi1-0005BK-Bf
 for linux-mtd@lists.infradead.org; Fri, 05 Aug 2016 11:54:38 +0000
Subject: Re: [PATCH v1 2/2] mtd: Add hooks to call get and put on mtd devices.
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <Sandeep_Jain@mentor.com>
 <1470320194-9602-1-git-send-email-Sandeep_Jain@mentor.com>
 <1470320194-9602-3-git-send-email-Sandeep_Jain@mentor.com>
 <CAFLxGvx7X=uQoDQp7HJNOWvfo-sGa+TmWM+q4VNPLF4KSS4+aQ@mail.gmail.com>
CC: Sandeep Jain <Sandeep_Jain@mentor.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>
From: "Baxter, Jim" <jim_baxter@mentor.com>
Message-ID: <91745308-1747-e7f5-46d0-83482e218a02@mentor.com>
Date: Fri, 5 Aug 2016 12:54:12 +0100
MIME-Version: 1.0
In-Reply-To: <CAFLxGvx7X=uQoDQp7HJNOWvfo-sGa+TmWM+q4VNPLF4KSS4+aQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi!
> 
> On Thu, Aug 4, 2016 at 4:16 PM, Sandeep Jain <Sandeep_Jain@mentor.com> wrote:
>> From: Jim Baxter <jim_baxter@mentor.com>
>>
>> Add hooks to mtdpart to call _get_device and _put_device,
>> this allows the mtd devices to perform internal
>> reference counting if required.
>>
>> Signed-off-by: Jim Baxter <jim_baxter@mentor.com>
>> Signed-off-by: Sandeep Jain <Sandeep_Jain@mentor.com>
> 
> I sent the same patch some time ago:
> https://patchwork.ozlabs.org/patch/644422/
> 

Hi Richard,

Thank you for letting us know.

Thanks,
Jim
