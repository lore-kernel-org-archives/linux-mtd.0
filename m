Received: from mail-bk0-f42.google.com ([209.85.214.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4UwD-0004I9-Ud
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2013 11:51:30 +0000
Received: by mail-bk0-f42.google.com with SMTP id jk14so210170bkc.1
 for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2013 04:51:02 -0700 (PDT)
Message-ID: <51F8FA24.9060904@gmail.com>
Date: Wed, 31 Jul 2013 13:51:00 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, linux-mtd@lists.infradead.org,
 grinberg@compulab.co.il, Gregory Clement <gregory.clement@free-electrons.com>,
 eric.miao@marvell.com, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>,
 nikita@compulab.co.il
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30.07.2013 01:24, Ezequiel Garcia wrote:
> This patchset is part of the work I'm doing to enable the pxa3xx-nand
> driver to support the NAND controller in Armada 370/XP. While this
> work in progress, here's a subet of patches I consider good enough
> for mainline.

What tree did you make this patch set against? I fail to apply it on top
of 3.11-rc3. Any particular patches I need before applying yours? Did
you push them to any public git repository maybe?


Thanks,
Daniel
