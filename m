Received: from s3.sipsolutions.net ([2a01:4f8:190:3424::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBewd-0006QR-OK
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 10:15:42 +0000
Message-ID: <1495188901.3274.0.camel@sipsolutions.net>
Subject: Re: [PATCH 08/29] rfkill.txt: standardize document format
From: Johannes Berg <johannes@sipsolutions.net>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-wireless@vger.kernel.org
Date: Fri, 19 May 2017 12:15:01 +0200
In-Reply-To: <3361dce0e96427ed8fc375ab78371c0a6d0f55cc.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
 <3361dce0e96427ed8fc375ab78371c0a6d0f55cc.1495157082.git.mchehab@s-opensource.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2017-05-18 at 22:25 -0300, Mauro Carvalho Chehab wrote:
> 
> +.. CONTENTS
>  
> +  1. Introduction
> +  2. Implementation details
> +  3. Kernel API
> +  4. Userspace support

Why not let this be auto-generated?

.. contents::
   :depth: 1

should work, no?

johannes
