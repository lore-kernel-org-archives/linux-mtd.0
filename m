Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NwrWp-0008RP-PU
	for linux-mtd@lists.infradead.org; Wed, 31 Mar 2010 06:35:52 +0000
Received: by wwa36 with SMTP id 36so1061814wwa.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 30 Mar 2010 23:35:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1269955969-26123-1-git-send-email-wferi@niif.hu>
References: <87mxxxltk6.fsf@tac.ki.iif.hu>
	<1269955969-26123-1-git-send-email-wferi@niif.hu>
Date: Wed, 31 Mar 2010 08:35:49 +0200
Message-ID: <k2u2ea1731b1003302335s84cf9757t8127050d242710f6@mail.gmail.com>
Subject: Re: [PATCH 0/3] RFC: direct MTD support for SquashFS
From: Marco Stornelli <marco.stornelli@gmail.com>
To: Ferenc Wagner <wferi@niif.hu>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Phillip Lougher <phillip.lougher@gmail.com>, linux-embedded@vger.kernel.org,
	Phillip Lougher <phillip@lougher.demon.co.uk>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/3/30 Ferenc Wagner <wferi@niif.hu>:
>
> Extra question: does squashfs_put_super require BKL protection?
>

We should get rid off of BKL, so if you need a lock, you should use a
local mutex.

Marco
