Received: from mailhost.elitecore.com ([203.88.135.194] helo=elitecore.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gm1Ry-0005q3-PB
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 00:12:19 -0500
Message-ID: <006501c70c62$0a8d4ff0$3d0fa8c0@elitecore1561>
From: "Darshak" <darshak@elitecore.com>
To: <srideep.devireddy@wipro.com>
References: <6AD9F6A5F6E096408F0B703773355A07016BBA00@CHN-SNR-MBX01.wipro.com>
Subject: Re: starter!
Date: Mon, 20 Nov 2006 10:39:22 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="koi8-r"; reply-type=original
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thanxs! man
    But I m at very basic steps .I have some questions?
1> Is the kernel 2.6 comes with JFFS2 support ? And how do i enable/compile 
with JFFS2.
2> After that How will I partition MY flash so its JFFS2? Any tool ot 
specific method of that ?

plz provide methods/steps u have to do this
Thanxs!



----- Original Message ----- 
From: <srideep.devireddy@wipro.com>
To: <darshak@elitecore.com>
Sent: Monday, November 20, 2006 10:19 AM
Subject: RE: starter!



Yes you can very well use jffs2 for nand . it works fine .

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org 
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Darshak
Sent: Monday, November 20, 2006 10:10 AM
To: dedekind@infradead.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: starter!


is JFFS2 is worth using for NAND flash ?
or it supports only NOR?

I come to know that JFFS2 has some problems at mounting [ takes longer
time ] and occupies more RAM?
How much time does it take to mount 512 and 1 GB flash? How much RAM does it
require?

Thanxs!
email: darshak@elitecore.com
----- Original Message -----
From: "Artem Bityutskiy" <dedekind@infradead.org>
To: <darshak@elitecore.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Saturday, November 18, 2006 6:21 PM
Subject: Re: starter!


> Hi,
>
> On Sat, 2006-11-18 at 14:49 +0530, darshak@elitecore.com wrote:
>> Hi All
>> I want to involve in JFFs3 development.
>> Please tell me what is required docs/knowledge for that.
>> How can I proceed for that ?
>
> I guess you may start from the JFFS3 docs available at
> http://www.linux-mtd.infradead.org/tech/JFFS3design.pdf
>
> It is quite old and we changed our minds about several things.
>
> You may also read Szeged guys docs at
> http://www.inf.u-szeged.hu/jffs2/jffs3.php
>
> But the last plan is to base JFFS3 on top of UBI which is a new
> promising piece of software. Look at
>
> http://www.linux-mtd.infradead.org/doc/ubi.html
> http://www.linux-mtd.infradead.org/faq/ubi.html
>
> So, to put it differently, there is no cool and clean documentation.
> There is some code and prototypes but they are far from something usable
> yet. But if you are eager enough you withstand this :-)
>
> Alternatively, there is a LogFS project, see
> http://www.linux-mtd.infradead.org/doc/logfs.html
>
> I do not follow it but there is some code exist. You may be interested.
>
> --
> Best regards,
> Artem Bityutskiy (âÉÔÀÃËÉÊ áÒÔ£Í)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


The information contained in this electronic message and any attachments to 
this message are intended for the exclusive use of the addressee(s) and may 
contain proprietary, confidential or privileged information. If you are not 
the intended recipient, you should not disseminate, distribute or copy this 
e-mail. Please notify the sender immediately and destroy all copies of this 
message and any attachments.

WARNING: Computer viruses can be transmitted via email. The recipient should 
check this email and any attachments for the presence of viruses. The 
company accepts no liability for any damage caused by any virus transmitted 
by this email.

www.wipro.com
