Received: from py-out-1112.google.com ([64.233.166.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ixome-0007xS-EG
	for linux-mtd@lists.infradead.org; Thu, 29 Nov 2007 19:10:54 +0000
Received: by py-out-1112.google.com with SMTP id a25so3974548pyi
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Nov 2007 11:10:42 -0800 (PST)
Message-ID: <f383264b0711291110k6e61ec29n212be5d4b059833e@mail.gmail.com>
Date: Thu, 29 Nov 2007 11:10:41 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: fix s3c2410 error correction
In-Reply-To: <1192755764-26269-1-git-send-email-mattjreimer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1192755764-26269-1-git-send-email-mattjreimer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Oct 18, 2007 5:02 PM, Matt Reimer <mattjreimer@gmail.com> wrote:
> From: Matt Reimer <mreimer@vpop.net>
>
> The single-bit error correction was, well, incorrect. For determing which
> bit to correct it was using P1' P2' P4' P8' instead of P1 P2 P4 P8, and
> it was using P16' P32' P64' P128' P256' P512' P1024' P2048' instead of
> P16 P32 P64 P128 P256 P512 P1024 P2048.

Is there any chance of this getting committed? It has been confirmed
to be needed on s3c2440 and s3c2412.

Matt
