Received: from mail-yh0-x232.google.com ([2607:f8b0:4002:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqqVw-00085R-99
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2013 20:36:13 +0000
Received: by mail-yh0-f50.google.com with SMTP id b6so5555919yha.9
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2013 12:35:50 -0800 (PST)
Date: Wed, 11 Dec 2013 12:35:44 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH for v3.13 0/2] pxa3xx-nand fixes for v3.13
Message-ID: <20131211203544.GT27149@ld-irv-0074.broadcom.com>
References: <1386680236-21698-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131211202015.GB5461@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131211202015.GB5461@localhost>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 11, 2013 at 05:20:16PM -0300, Ezequiel Garcia wrote:
> Brian:
> 
> Do you plan to include these in a pull for Linus?

Yes. I was giving people (myself, and others) time to look at these, but
I plan to queue them up in linux-mtd.git soon, along with removing the
'compatible' property (your other patch).

Brian
