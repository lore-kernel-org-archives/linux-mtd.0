Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pxzx8-0005tF-TZ
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2011 10:52:15 +0000
Received: by ewy3 with SMTP id 3so897797ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Mar 2011 02:52:13 -0800 (PST)
Subject: Re: [PATCH/RFC v4 1/3] Shared BCH ECC library
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
In-Reply-To: <1fb708d8d49cdd83e62424fb77912418f5c92d69.1299836869.git.ivan.djelic@parrot.com>
References: <1fb708d8d49cdd83e62424fb77912418f5c92d69.1299836869.git.ivan.djelic@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Mar 2011 12:50:42 +0200
Message-ID: <1299840642.2732.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-03-11 at 11:05 +0100, Ivan Djelic wrote:
> Hello,
> 
> The first patch of this series contains a new generic BCH ECC library.
> 
> This library can be used to provide software BCH correction on NAND devices
> (see 2nd and 3rd patch), as well as error correction for hybrid hardware BCH
> engines.
> 
> This version v4 fixes coding style issues.
> 
> Could you please review and comment ?
> Thanks,

I've updated my tree with these patches, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
