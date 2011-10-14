Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REhQb-0004v1-5V
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 13:03:57 +0000
Received: by wyi11 with SMTP id 11so3675180wyi.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 06:03:55 -0700 (PDT)
Subject: Re: Make phram work with kernel cmdline args when built-in
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Fache, Herve" <h-fache@ti.com>
Date: Fri, 14 Oct 2011 16:03:24 +0300
In-Reply-To: <CA+Xn3W18bwZWzdjmRzEDUCqe3bVHnmW-7bJ_wvaoXpJxO1KmjQ@mail.gmail.com>
References: <CA+Xn3W3-JCqMKjiXi2cLCGm_bHtRx8RPsc9P5BoOS6YmbGZmHw@mail.gmail.com>
	<20111012164837.GA13691@logfs.org>
	<CA+Xn3W18bwZWzdjmRzEDUCqe3bVHnmW-7bJ_wvaoXpJxO1KmjQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1318597412.12351.124.camel@sauron>
Mime-Version: 1.0
Cc: Joern Engel <joern@lazybastard.org>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-10-13 at 15:30 +0200, Fache, Herve wrote:
> Hi again Jörn,
> 
> Please find attached a revised version of the patch.

Please, send patches inline. Also, try to make sure you do not
have many of these #ifdef MODULE sections.

-- 
Best Regards,
Artem Bityutskiy
