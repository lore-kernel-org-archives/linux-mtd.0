Received: from mail-ew0-f208.google.com ([209.85.219.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfedR-0007nc-Is
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 18:51:22 +0000
Received: by ewy4 with SMTP id 4so2764667ewy.27
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Aug 2009 11:51:15 -0700 (PDT)
Message-ID: <4A92E0EA.1050406@billgatliff.com>
Date: Mon, 24 Aug 2009 13:50:18 -0500
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: Ideal NAND flashes for JFFS2 or YAFFS
References: <OF10187A22.DA46F228-ONC125761A.002E1EB3-C125761A.002EB9BA@transmode.se>	<4A8FAEFA.6070304@gmail.com>
	<OF11C243C2.270CA549-ONC125761C.00667367-C125761C.0066E7FE@transmode.se>
In-Reply-To: <OF11C243C2.270CA549-ONC125761C.00667367-C125761C.0066E7FE@transmode.se>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund wrote:
> hmm, maybe I should look at UBIFS too :)
>   

I'm currently a big fan of UBIFS for NAND.  I'd take a look at it.

I haven't compared it to YAFFS2, but UBIFS is in mainline kernels, where 
YAFFS2 isn't.  That gives UBIFS bonus points for convenience.  And so 
far for me, UBIFS has been really, really solid.


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
