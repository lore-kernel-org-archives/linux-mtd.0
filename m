Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RY29a-0008Iv-At
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 21:02:18 +0000
Received: by laah2 with SMTP id h2so883059laa.36
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2011 13:02:16 -0800 (PST)
Subject: Re: [PATCH (mtd-www) 01/13] nand-data: update TC58DVM72A1TG00 BBM info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Date: Tue, 06 Dec 2011 23:02:14 +0200
In-Reply-To: <1323173269-19931-1-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323205335.2710.2.camel@koala>
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

Thanks, I'll let Brian comment on this first.

Artem.
