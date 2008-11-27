Received: from wf-out-1314.google.com ([209.85.200.173])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L5VvS-0006BN-Il
	for linux-mtd@lists.infradead.org; Thu, 27 Nov 2008 01:44:14 +0000
Received: by wf-out-1314.google.com with SMTP id 28so725362wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Nov 2008 17:44:13 -0800 (PST)
Message-ID: <8bd0f97a0811261744m71593462md64fd363cbdc5062@mail.gmail.com>
Date: Wed, 26 Nov 2008 20:44:13 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Enrico Scholz" <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH/mtd-utils] Separate '-m' and the mode with a space when
	invoking 'install'
In-Reply-To: <1227706065-3067-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1227706065-3067-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 26, 2008 at 08:27, Enrico Scholz wrote:
> Some 'install' versions (e.g. this of OpenEmbedded) require the mode
> to be a separate argument and don't understand the '-m0755' syntax:

then why dont you fix the `install` that comes with OE rather than
spuriously patching random build systems out there ?
-mike
