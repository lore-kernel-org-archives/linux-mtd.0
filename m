Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REiHD-0005Ra-TB
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 13:58:20 +0000
Received: by wwg9 with SMTP id 9so820903wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 06:58:15 -0700 (PDT)
Subject: Re: nand_base.c:nand_get_flash_type() test results
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Date: Fri, 14 Oct 2011 16:57:46 +0300
In-Reply-To: <4E95B1B4.7040603@st.com>
References: <4E95B1B4.7040603@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318600673.12351.131.camel@sauron>
Mime-Version: 1.0
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

On Wed, 2011-10-12 at 16:26 +0100, Angus CLARK wrote:
> Hi All,
> 
> While attempting to add support for some of the more recent NAND devices, I
> ended up refactoring nand_get_flash_type() code.  The refactoring was primarily
> aimed at simplifying the way in which the growing number 'READID' decoding
> exceptions could be accommodated.

Why not to send the refactored code as well?

-- 
Best Regards,
Artem Bityutskiy
