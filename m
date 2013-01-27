Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TzRgH-000685-9V
 for linux-mtd@lists.infradead.org; Sun, 27 Jan 2013 12:49:53 +0000
Date: Sun, 27 Jan 2013 13:10:24 +0000
From: Alan Cox <alan@linux.intel.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] goldfish: NAND flash driver
Message-ID: <20130127131024.71bbcff1@bob.linux.org.uk>
In-Reply-To: <871ud7odlc.fsf@free.fr>
References: <20130121234502.19934.61017.stgit@bob.linux.org.uk>
 <87r4lboco1.fsf@free.fr> <20130123221245.2a3021ce@bob.linux.org.uk>
 <871ud7odlc.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> PS: I have the responsiveness of a diseased turttle, and I don't
> expect things will improve in the next days as I changed my home, so
> please be patient (or convince my boss :))

No problem. It'll be a while before I can test the lock changes so I've
pushed it to staging for now with your original TODO items as the fix
list. That way we have a root fs on Goldfish with a base kernel and can
get the other changes done over time.

Alan
