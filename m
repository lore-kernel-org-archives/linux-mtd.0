Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QEfmN-0008Kg-Si
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 10:46:05 +0000
Message-ID: <4DB6A266.5050509@denx.de>
Date: Tue, 26 Apr 2011 12:45:58 +0200
From: Stefano Babic <sbabic@denx.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ubiformat: libmt error (side effect from last Large Buffer
	Allocations patch)
References: <4DB66CA3.2040906@denx.de> <1303807043.2778.45.camel@localhost>
In-Reply-To: <1303807043.2778.45.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: marathon96@gmail.com, linux-mtd@lists.infradead.org,
	Bastian Ruppert <bastian.ruppert@sewerin.de>,
	Stefano Babic <sbabic@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/26/2011 10:37 AM, Artem Bityutskiy wrote:
> Hi,

Hi Artem,

> Yes, I think this is the right solution. I've cooked the following
> patch, compile-tested only - please review and test.

I have applied and tested your patch and the problem is solved.

Tested-by: Stefano Babic <sbabic@denx.de>

Best regards,
Stefano Babic

-- 
=====================================================================
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
=====================================================================
