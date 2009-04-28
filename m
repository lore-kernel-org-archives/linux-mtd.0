Received: from co203.xi-lite.net ([149.6.83.203])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LypyQ-0007Na-9A
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 16:16:15 +0000
Message-ID: <49F72BBB.7020207@parrot.com>
Date: Tue, 28 Apr 2009 18:15:55 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Re: m25p80 : chip not supporting OPCODE_BE
References: <4941418F.2070802@parrot.com>
In-Reply-To: <4941418F.2070802@parrot.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthieu CASTET a écrit :
> Hi,
> 
> it seems the m45peXX flash are not supporting OPCODE_BE command [1].
> Shouldn't we add a flag to avoid to issue such command on such flash ?
> 
> 
> 
> Matthieu
> 
> [1]
> http://www.numonyx.com/Documents/Datasheets/M45PE80.pdf
> 

ping
