Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DS5A-0008Ak-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 15:38:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B3359F7.64241206@daniel.com> 
References: <3B3359F7.64241206@daniel.com>  <993219781.58250@email.aftek.com> 
To: Vipin Malik <vipin.malik@daniel.com>
Cc: ashwinp@aftek.com, linux-mtd@lists.infradead.org
Subject: Re: Is my flash being detected? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 22 Jun 2001 15:44:14 +0100
Message-ID: <16637.993221054@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


vipin.malik@daniel.com said:
> Ok, I hit send too quickly. If you flash is not CFI, then make sure
> that the JDEC module is included. 

> > It does say that AMd flash found but at the end it complains that
> > "cfi_probe: No supported Vendor Command Set found"

It looks like it's CFI. The code being used is very old though - 
CONFIG_MTD_CFI_AMDEXT was corrected to CONFIG_MTD_CFI_CMDSTD a long time 
ago. Please update to the latest code and send the full output.

--
dwmw2
