Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DXqqi-0002c1-HN
	for linux-mtd@lists.infradead.org; Mon, 16 May 2005 21:26:21 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <428899DA.3040507@netwinder.org>
References: <1116226208.31694.26.camel@server11>
	<428899DA.3040507@netwinder.org>
Content-Type: text/plain
Date: Tue, 17 May 2005 09:26:22 +0800
Message-Id: <1116293182.31694.47.camel@server11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: stdio.h and kernel space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

They are not part of the kernel. I downloaded then from AMD's website
and would like to know how to use them



On Mon, 2005-05-16 at 09:02 -0400, Ralph Siemsen wrote:
> Munira Ahmed wrote:
> > I believe that stdio.h is used only in user space. If I am correct that
> > can anybody please tell me why lld.c, low level driver for AMD CFI
> > flash, contains stdio.h as header file?
> 
> You are correct, stdio.h is for userspace.  However I do not see the 
> file lld.c in any standard kernel tree, either version 2.4 or 2.6. 
> Where did you get your kernel source from, which version is it, and what 
> patches have been applied to it?
> 
> -R
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
-- 
Munira Ahmed
Senior Embedded Specialist

Radixs Pte Ltd
Email:munira.ahmed@radixs.com


Main: +65 6335 8600
Fax: +65 6335 8601
URL: www.radixs.com 

1 Temasek Avenue, #21-01, Millenia Tower, Singapore 039192

Disclaimer Notice: This email, its content and any files transmitted
with it are intended solely for the addressee(s) and may be confidential
and privileged. Any unauthorised disclosure or use or dissemination of
the information contained herein, either whole or partial, is
prohibited. Radixs Pte Ltd (Radixs) cannot accept liability for any
statements made which are clearly the sender's own and not expressly
made on behalf of Radixs or one of its agents. If you have received this
message in error, please notify the sender immediately, and delete this
email from your computer system. Radixs has taken reasonable precaution
to ensure no viruses are present in this email, however Radixs does not
accept responsibility for any loss or damage arising from the use of
this email or attachments.

Co. Reg. 200104892Z
