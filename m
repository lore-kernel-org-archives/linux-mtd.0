From: David Woodhouse <dwmw2@infradead.org>
To: srideep.devireddy@wipro.com
In-Reply-To: <6AD9F6A5F6E096408F0B703773355A07E252C5@CHN-SNR-MBX01.wipro.com>
References: <6AD9F6A5F6E096408F0B703773355A07E252C5@CHN-SNR-MBX01.wipro.com>
Content-Type: text/plain
Date: Mon, 08 May 2006 21:51:02 +0100
Message-Id: <1147121462.2694.33.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Jffs2 memory problem ..
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-09 at 00:52 +0530, srideep.devireddy@wipro.com wrote:
>        We are using MPC 8247 . processor with 32MB sdram and we are
> using 2.4 Montavista linux kernel .when I make my board up ...I use a
> top and see my memory consumption is 8 Mb and 23Mb is free .After
> running the card with applications for almost 1 or 2 days ... when I
> reboot the card I am not able to run my application . If I then use a
> top command see memory consumption is 27MB and free is 3 Mb . only
> think
> I can do to run my applications is to reformat the file system and run
> the applications ....then it will run for another day . until it get
> to memory usage of 27 MB . Please do let me know if any one have any
> pointers on this ...which will solve my the Problem ...

Unless you are using the _standard_ JFFS2 code from the 2.4.32 kernel,
without any modifications, then you need to contact Montavista for
support -- only they can help you. 

Check the memory usage with 'slabtop' or manually reading
from /proc/slabinfo. 

If it's being taken up in JFFS2 data structures, then it could be a
known problem. Are you making lots of short writes to some files, like
syslog files?

> The information contained in this electronic message and any
> attachments to this message are intended for the exclusive use of the
> addressee(s) and may contain proprietary, confidential or privileged
> information. If you are not the intended recipient, you should not
> disseminate, distribute or copy this e-mail. Please notify the sender
> immediately and destroy all copies of this message and any
> attachments.
> 
> WARNING: Computer viruses can be transmitted via email. The recipient
> should check this email and any attachments for the presence of
> viruses. The company accepts no liability for any damage caused by any
> virus transmitted by this email. 

Do not _EVER_ post to my lists with a disclaimer like this again. I
consider it an abuse of the service I provide to the community, and I
will report it as network abuse if it happens again. Make sure you
contact your sysadmin and/or your manager and make sure this disclaimer
is not added to your mail in future.

-- 
dwmw2
