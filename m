Received: from mail45.e.nsc.no ([193.213.115.45])
	by pentafluge.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJyZO-0003l2-Fu
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 19:18:56 +0100
Received: from hjemme (062016181233.customer.alfanett.no [62.16.181.233])
	by mail45.nsc.no (8.12.11/8.12.11) with ESMTP id i9JIHZmp025894
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Oct 2004 20:17:35 +0200 (CEST)
From: Jan Vestby <vestby@alfanett.no>
To: linux-mtd@lists.infradead.org
Date: Tue, 19 Oct 2004 20:16:02 +0200
References: <OF9C244FBD.F36AE939-ON85256F31.00585A10-85256F31.005A79E1@nanometrics.ca>
In-Reply-To: <OF9C244FBD.F36AE939-ON85256F31.00585A10-85256F31.005A79E1@nanometrics.ca>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200410192016.02411.vestby@alfanett.no>
Subject: Re: JFFS2 behaviour when large number of files are created.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 18 October 2004 18:28, David Ho wrote:
> Hi all,
>
> I have a snapshot of the CVS MTD/JFFS2 code from Sept 22 patched into a
> 2.4.24 kernel.  In the process of running a varied set of applications on
> the system, a program was creating a large number of small files each less
> than 1KB.  The Linux card is powered up for a short period of time to dump
> data to persistent storage, then it is powered down for until the next data
> dump.  As the sytem is run, the mount is becoming slower to a point that
> the watchdog is reset the card.
>
> It appears that JFFS2 is bad for certain usage patterns.  Creating large
> number of files is one.  What other usage patterns should I avoid?
>
I have seen startup time is quite nonlinear with respect to the number of 
files per directory. You could try to restrict the size of directories.

regards
jan vestby 
