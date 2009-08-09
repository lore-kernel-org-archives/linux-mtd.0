Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma2xb-0005jv-KC
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 07:36:59 +0000
Message-ID: <4A7E7C38.3000600@gmail.com>
Date: Sun, 09 Aug 2009 10:35:20 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Manoj <manoj23@gmail.com>
Subject: Re: mtd gluebi issue
References: <1c3f4270907291432v63b064a2r71806b7d414782a@mail.gmail.com>
In-Reply-To: <1c3f4270907291432v63b064a2r71806b7d414782a@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/30/2009 12:32 AM, Manoj wrote:
> I am trying to use jffs2 on ubi volumes using CONFIG_MTD_UBI_GLUEBI
> option. I have also enabled CONFIG_JFFS2_FS_WBUF_VERIFY to verify
> every write from jffs2. The kenel seems to crash in
> jffs2_verify_write() because wbuf_verify is not initialized. It needs
> to be initialized in jffs2_ubivol_setup() like how it is done in
> jffs2_nand_flash_setup. Am I seeing it right?

Not sure I understand what is the problem. Please, send a better report,
see here:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_how_send_bugreport

Also, take into account this:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
