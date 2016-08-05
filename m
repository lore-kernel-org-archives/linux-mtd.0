Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVe18-0006sH-LO
 for linux-mtd@lists.infradead.org; Fri, 05 Aug 2016 12:14:24 +0000
Subject: Re: [PATCH v1 2/2] mtd: Add hooks to call get and put on mtd devices.
To: "Baxter, Jim" <jim_baxter@mentor.com>
References: <Sandeep_Jain@mentor.com>
 <1470320194-9602-1-git-send-email-Sandeep_Jain@mentor.com>
 <1470320194-9602-3-git-send-email-Sandeep_Jain@mentor.com>
 <CAFLxGvx7X=uQoDQp7HJNOWvfo-sGa+TmWM+q4VNPLF4KSS4+aQ@mail.gmail.com>
 <91745308-1747-e7f5-46d0-83482e218a02@mentor.com>
Cc: Sandeep Jain <Sandeep_Jain@mentor.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57A48302.30708@nod.at>
Date: Fri, 5 Aug 2016 14:13:54 +0200
MIME-Version: 1.0
In-Reply-To: <91745308-1747-e7f5-46d0-83482e218a02@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.08.2016 um 13:54 schrieb Baxter, Jim:
>> On Thu, Aug 4, 2016 at 4:16 PM, Sandeep Jain <Sandeep_Jain@mentor.com> wrote:
>>> From: Jim Baxter <jim_baxter@mentor.com>
>>>
>>> Add hooks to mtdpart to call _get_device and _put_device,
>>> this allows the mtd devices to perform internal
>>> reference counting if required.
>>>
>>> Signed-off-by: Jim Baxter <jim_baxter@mentor.com>
>>> Signed-off-by: Sandeep Jain <Sandeep_Jain@mentor.com>
>>
>> I sent the same patch some time ago:
>> https://patchwork.ozlabs.org/patch/644422/

Brian, can you please pickup my patch for 4.8-rcX?
The patch fixes a real problem and another patch from
Mentor folks depends on it.

Thanks,
//richard
