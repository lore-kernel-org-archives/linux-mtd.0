Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQ0SK-0000yH-PX
 for linux-mtd@lists.infradead.org; Mon, 23 Feb 2015 21:22:22 +0000
Message-ID: <54EB99F1.4040608@nod.at>
Date: Mon, 23 Feb 2015 22:21:53 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: fix missing brace control flow
References: <1424725642-26270-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1424725642-26270-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 23.02.2015 um 22:07 schrieb Brian Norris:
> commit 0e707ae79ba3 ("UBI: do propagate positive error codes up") seems
> to have produced an unintended change in the control flow here.
> 
> Completely untested, but it looks obvious.
> 
> Caught by Coverity, which didn't like the indentation. CID 1271184.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Should go into 4.0, I expect.

Good catch, patch tested and applied!

Thank you Brian!
//richard
