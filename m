Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GCy2b-0007BQ-EV
	for linux-mtd@lists.infradead.org; Tue, 15 Aug 2006 08:29:09 -0400
Received: by ug-out-1314.google.com with SMTP id u40so359222ugc
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Aug 2006 05:29:03 -0700 (PDT)
Message-ID: <625fc13d0608150529j68b8a4e1r739a251375a6f028@mail.gmail.com>
Date: Tue, 15 Aug 2006 07:29:03 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "takasi-y@ops.dti.ne.jp" <takasi-y@ops.dti.ne.jp>
Subject: Re: [PATCH] PHYSMAP depens on CFI or JEDECPROBE or ROM
In-Reply-To: <20060804230802.80dc086b.takasi-y@ops.dti.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20060803222818.7f8f0286.takasi-y@ops.dti.ne.jp>
	<20060804230802.80dc086b.takasi-y@ops.dti.ne.jp>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/4/06, takasi-y@ops.dti.ne.jp <takasi-y@ops.dti.ne.jp> wrote:
> # posting it agein.
> map/physmap.c tries to probe "cfi_probe", "jedec_probe" and "map_rom", but
> map/Kconfig says it depends on MTD_CFI only.
> This patch adds  MTD_JEDECPROBE and MTD_ROM to the dependency condition.

I've committed this one to my tree as well.  In the future, it would
be better to generate patches with a strip level of 1 and based on the
MTD git tree instead of CVS.  The MTD CVS tree is dead now.

thx,
josh
