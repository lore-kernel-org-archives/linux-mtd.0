Received: from nf-out-0910.google.com ([64.233.182.188])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GT4zc-0004AM-Ai
	for linux-mtd@lists.infradead.org; Fri, 29 Sep 2006 00:08:36 +0100
Received: by nf-out-0910.google.com with SMTP id l37so896121nfc
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Sep 2006 16:07:34 -0700 (PDT)
Message-ID: <625fc13d0609281607l5d2ad581k9615afa8d4f3caa@mail.gmail.com>
Date: Thu, 28 Sep 2006 18:07:34 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
Subject: Re: Different erase block sizes in a JFFS2 partion.
In-Reply-To: <01de01c6e348$c94e7330$1267a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <01de01c6e348$c94e7330$1267a8c0@Jocke>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/28/06, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:
> Got multiple NOR chips with top and bottom boot blocks with diffrent EB size
> then the rest of the blocks.

Intel P30?  IIRC, the MTD driver maps those into a set of larger
virtual eraseblocks.  You might not be able to even distinguish that
they exist.

josh
