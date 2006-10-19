Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GaYll-0000e4-Sw
	for linux-mtd@lists.infradead.org; Thu, 19 Oct 2006 10:21:35 -0400
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J7D00CWQZV6D6E4@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 19 Oct 2006 10:21:07 -0400 (EDT)
Date: Thu, 19 Oct 2006 10:21:06 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: patch to leave cfi in read-array on suspend(reposted)
In-reply-to: <20061019140534.10858.qmail@web54408.mail.yahoo.com>
To: David Anders <dave123_aml@yahoo.com>
Message-id: <Pine.LNX.4.64.0610191020180.1971@xanadu.home>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20061019140534.10858.qmail@web54408.mail.yahoo.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 19 Oct 2006, David Anders wrote:

> greetings,
> 
> during some testing with several samsung s3c24xx based
> devices it was discovered that often the
> cfi_cmdset_0001.c would not leave the chip in
> read-array mode on suspend. this is an issue if the
> same flash chip is used for the bootloader that needs
> to be read on resume. attached is a patch generated
> against the 2.6.18 kernel and has been tested with
> several s3c24xx based devices as well as several sharp
> lh79520 devices. your feedback would be appreciated.
> 
> Signed-off-by: David Anders <danders@amltd.com>

Signed-off-by: Nicolas Pitre <nico@cam.org>
