Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKVg2-00022c-Lb
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 13:11:42 +0000
Received: by ewy3 with SMTP id 3so493838ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 06:11:34 -0700 (PDT)
Subject: Re: Coldfire, d9000e and patch RFC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: angelo <angelo70@gmail.com>
In-Reply-To: <4DC8F73A.1070708@gmail.com>
References: <4DC8F73A.1070708@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 16:08:10 +0300
Message-ID: <1305205690.14423.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-net@vger-kernel.org,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	uClinux development list <uclinux-dev@uclinux.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-10 at 10:28 +0200, angelo wrote:
> Hi all,
> 
> some months ago i posted to these lists (net, m68k) a patch.
> 
> http://marc.info/?l=linux-m68k&m=129447772217552&w=2 
> <http://marc.info/?l=linux-m68k&m=129447772217552&w=2>
> 
> I did a small job to allow dm9000e to be used with a Coldfire processor, 
> and for the functional point of view the patch works fine.

Well, one obvious suggestion is that you should not introduce any
Kconfig option for this and you should get the information about the bus
from the bootloader via the device tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
