Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYmIO-0000uf-La
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2011 22:18:29 +0000
Received: by laam7 with SMTP id m7so557661laa.36
 for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2011 14:18:26 -0800 (PST)
Subject: Re: [PATCH (mtd-www) 01/13] nand-data: update TC58DVM72A1TG00 BBM info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Date: Fri, 09 Dec 2011 00:18:25 +0200
In-Reply-To: <1323173269-19931-1-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323382706.2074.14.camel@koala>
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

On Tue, 2011-12-06 at 12:07 +0000, Angus CLARK wrote:
> Update Toshiba TC58DVM72A1TG00 bad block marker information to "1st page (6th
> byte in OOB = non FFh)", as described in datasheet, and confirmed with Toshiba
> engineers.
> 
> Signed-off-by: Angus Clark <angus.clark@st.com>

Could you please use --no-chain-reply-to when using git-send-email, or
better add this option to you ~/.gitconfig - I think it is generally
known that chained replies are PITA to use, especially with long patch
series.

Thanks!
