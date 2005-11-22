Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EegY6-0007EM-TR
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 17:23:43 -0500
Message-ID: <43839A91.6010101@mvista.com>
Date: Tue, 22 Nov 2005 14:24:17 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: "Menon, Nishanth" <x0nishan@ti.com>
References: <520AB2AD990DC04082102F77CA17263801CE70B4@dlee03.ent.ti.com>
In-Reply-To: <520AB2AD990DC04082102F77CA17263801CE70B4@dlee03.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Jffs2 issue on latest mtd for Sibley NOR
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Menon, Nishanth wrote:

> Sibley: buffer write error (status 0x190)

According to the datasheet that looks like:

SR[9] SR[8] SR[4]
0     1     1     = Error - Attempted rewrite to Object Mode region

but I've no clue what causes it...

-- 
Todd
