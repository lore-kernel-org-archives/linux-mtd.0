Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q75sE-0003uS-Oi
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 13:00:48 +0000
Received: by bwz1 with SMTP id 1so318314bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Apr 2011 06:00:44 -0700 (PDT)
Subject: Re: [PATCH V7] MIPS: lantiq: add NOR flash support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
In-Reply-To: <4D9B11C5.3030308@openwrt.org>
References: <1302006830-10345-1-git-send-email-blogic@openwrt.org>
	<1302006995.2760.120.camel@localhost>  <4D9B11C5.3030308@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 15:58:04 +0300
Message-ID: <1302008284.2760.129.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-05 at 14:57 +0200, John Crispin wrote:
> we could dynamically allocate the instance of struct map_info and then
> use map_priv_1 to indicate whether the device is probing or not.

Yeah, may be you could indeed use map_priv_1 instead of the global
variable already now? 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
