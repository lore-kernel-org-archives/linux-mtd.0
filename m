Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCAnl-0004ad-T1
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 12:12:38 +0000
Subject: Re: [PATCHv4] mtd-utils: use new 64-bit ioctls + sysfs to support
	>4GiB devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: saeed bishara <saeed.bishara@gmail.com>
In-Reply-To: <AANLkTikr1Ukc3o0NgGS02cst2Wjkl74kw6OB8uzcK8L-@mail.gmail.com>
References: <a95a62fe0904031318q21bb727ft297aaa5edc18e2a@mail.gmail.com>
	<AANLkTinZtqLjdmVyvo9F9uEnLb3YL0V2-n0Gt7vObpj5@mail.gmail.com>
	<1273567389.2209.173.camel@localhost>
	<AANLkTikr1Ukc3o0NgGS02cst2Wjkl74kw6OB8uzcK8L-@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 May 2010 15:11:29 +0300
Message-ID: <1273666289.22706.79.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tawfic Bayyouk <tawficb@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-12 at 14:25 +0300, saeed bishara wrote:
> attached updated version of the patch.
> also, another patch added to make the ubi format use the 64bit erase ioctl.

It is better get them from Kevin.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
