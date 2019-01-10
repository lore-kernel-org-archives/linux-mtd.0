Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghdwX-0005R0-6L
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2019 17:16:34 +0000
Received: by mail-lj1-x22f.google.com with SMTP id u89-v6so10414708lje.1
 for <linux-mtd@lists.infradead.org>; Thu, 10 Jan 2019 09:16:32 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id w12sm14304777lfe.80.2019.01.10.09.16.29
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jan 2019 09:16:29 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id t9-v6so10409428ljh.6
 for <linux-mtd@lists.infradead.org>; Thu, 10 Jan 2019 09:16:29 -0800 (PST)
MIME-Version: 1.0
References: <20190110092531.766738a0@bbrezillon>
In-Reply-To: <20190110092531.766738a0@bbrezillon>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 10 Jan 2019 09:16:12 -0800
Message-ID: <CAHk-=wgKMPd0R9dXkJ+49s-rt+=YHTKgBX2WhBieFzi88_=ZYQ@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Fixes for 5.0-rc2
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Marek Vasut <marex@denx.de>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 10, 2019 at 12:25 AM Boris Brezillon <bbrezillon@kernel.org> wrote:
>
> MTD Fixes:
> - Fix a bug introduced when exposing MTD devs as NVMEM providers and
>   check for add_mtd_device() return code everywhere

Ahh, and this should fix the reported NULL pointer thing in sysfs.

Thanks, pulled.

               Linus
