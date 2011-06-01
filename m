Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRgyu-0003cL-Ai
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 08:40:49 +0000
Received: by yic15 with SMTP id 15so2555873yic.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 01:40:46 -0700 (PDT)
Subject: Re: [Ubi] Wrong major:minor
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
In-Reply-To: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 11:36:21 +0300
Message-ID: <1306917381.4405.76.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-05-29 at 12:39 +0200, Gilles wrote:
> Hello
> 
> I used the following data to compile Ubi(fs) into a uClinux kernel:
> 
> ========= device_table.txt
> #UBIFS nodes
> /dev/ubi_ctrl	c	644	0	0	10	63	0	0	-
> /dev/ubi0	c	644	0	0	253	0	0	0	-
> ========= 

But I guess you may add an UBI module parameter which will ask UBI to
use major numbers you want - should be easy to do. E.g., if you add a
'major_base=200' parameter then UBI will use 200:0 for ubi0, 201:0 for
ubi1, 200:1 for ubi0_0, 200:2 for ubi0_1, etc.

Then you could do:

modprobe ubi major_base=200

or add

ubi.major_base=200

to you kernel parameters if you have UBI compiled-in.
 
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
