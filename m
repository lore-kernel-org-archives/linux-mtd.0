Received: from mail-ig0-x22c.google.com ([2607:f8b0:4001:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y76i2-000316-Mj
 for linux-mtd@lists.infradead.org; Fri, 02 Jan 2015 18:12:27 +0000
Received: by mail-ig0-f172.google.com with SMTP id a13so4947968igq.5
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2015 10:12:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54A35C3C.7070301@huawei.com>
References: <CALupW3Dv=OvY-5y_ScG1St8HUBYfXYpTnYAWDt_GJ+3+7KmC9Q@mail.gmail.com>
 <54A35C3C.7070301@huawei.com>
Date: Fri, 2 Jan 2015 10:12:05 -0800
Message-ID: <CALupW3DBkDGAmbaUR9eg0qFkuc71qc8Uea-+TGbTo5UoU7erPw@mail.gmail.com>
Subject: Re: Does UBIFS NAND ECC info get stored in OOB?
From: Steve deRosier <derosier@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hu,


On Tue, Dec 30, 2014 at 6:15 PM, hujianyang <hujianyang@huawei.com> wrote:
> On 2014/12/31 3:44, Steve deRosier wrote:
>> I'm starting to assume that you're simply saying that UBIFS itself
>> doesn't use the OOB area, nor even handles the ECC itself, but that's
>> up to the chip driver layer. And that the driver will handle the ECC
>> and OOB as appropriate.  Am I correct?
>>
>
> Yes, you are right.
>
> UBIFS doesn't directly write to OOB area. MTD or nand controller is
> responsible to the data management in OOB area.
>

Thanks for your answer, I was looking to see if I interpreted it right
and it looks like that's the case.


> I think the announce "neither UBIFS nor UBI use OOB area" is compared
> to the filesystem which directly write data to OOB area across the
> interface provided by lower layer. For example, Yaffs2? I not sure
> of it.
>

I have no clue. I'm glad that UBIFS doesn't use OOB for it's own
meta-data because I'm about to up our ECC strength to 8-bit, which
will take up nearly all the OOB area.  I was just worried that it
meant that it was keeping and doing ECC elsewhere, and I wanted to
know how it was doing that.

Thanks,
- Steve
