Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFq7O-0003fU-IK
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2011 16:00:35 +0000
Received: by wyb28 with SMTP id 28so3749462wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Apr 2011 09:00:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1304073070-24526-4-git-send-email-bdefaria@adeneo-embedded.com>
References: <1304073070-24526-1-git-send-email-bdefaria@adeneo-embedded.com>
	<1304073070-24526-4-git-send-email-bdefaria@adeneo-embedded.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 29 Apr 2011 21:30:11 +0530
Message-ID: <BANLkTi=c1Dc0Y=2eGof=5c4075=1RnCgdQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] omap : nand : fix subpage ecc issue with prefetch
To: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: jjhiblot@adetelgroup.com, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 29, 2011 at 4:01 PM, Bryan DE FARIA
<bdefaria@adeneo-embedded.com> wrote:
> When reading a subpage with a non dividable by 4 ecc number of byte, the
> prefetch function gets first the extra bytes, then reads the bytes lefting.
> Extra bytes are not returned in the buffer (they are overwritten), which makes
> the software ecc fail.

Its not only read, write too is broken for the same reason. More ever,
it is broken for
other path too (failing to enable prefetch engine path).

-- 
Regards,
Vimal Singh
