Subject: RE: MLC Support in JFFS2
From: Artem Bityutskiy <dedekind@infradead.org>
To: apgmoorthy <moorthy.apg@samsung.com>
In-Reply-To: <AC2E6612F7284933840F22ED22E239CE@sisodomain.com>
References: <1C48A8694DD447A0A922790E587F7D5F@sisodomain.com>
	<4A3F3718.1070102@gmail.com>
	<AC2E6612F7284933840F22ED22E239CE@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Jun 2009 16:41:56 +0300
Message-Id: <1245678116.9487.46.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: 'Amit Kumar Sharma' <amitsharma.9@samsung.com>, vishak.g@samsung.com,
	'Artem Bityutskiy' <dedekind1@gmail.com>,
	'Amul Saha' <amul.saha@samsung.com>, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-22 at 19:03 +0530, apgmoorthy wrote:
> Yes it do that .
> There are two things in Handling MLCs
> 1.Paired Page Handling
> This is done in Flex-OneNAND Driver.
> flexonenand_lsb_page_recovery will handle that in MLC area. 

Ah, ok you do this at the driver level - good.

> 2.NOP==1
> This scenario has to be dealt in synchronization with JFFS2.
> This is what i asked about. 
> Pathces , in the links(above)are addressing this.

OK, I see.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
