From: David Woodhouse <dwmw2@infradead.org>
To: Andy Hawkins <a.hawkins@cabletime.com>
In-Reply-To: <1090848742.2219.3.camel@adh>
References: <1090848742.2219.3.camel@adh>
Content-Type: text/plain
Date: Thu, 29 Jul 2004 15:41:57 -0400
Message-Id: <1091130117.4133.30.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem writing to NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-07-26 at 14:32 +0100, Andy Hawkins wrote:
> To see if this problem has now been fixed, I have just downloaded the
> latest snapshot to try. However, I can no longer get this to compile.
> After changing some Makefiles, I have now found that the new code uses
> 'kvec' in place of 'iovec'. Is this a 2.6 feature?

Yes.

> If so, are there any plans to make the current MTD code work with 2.4?

No.

> What would people recommend we do in order to get working MTD support
> for the chips on our board for a 2.4 kernel?

Use 2.6.

-- 
dwmw2
