Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Im8Eg-0007Cd-NY
	for linux-mtd@lists.infradead.org; Sun, 28 Oct 2007 13:31:28 +0000
Date: Sun, 28 Oct 2007 12:52:41 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: getdents64 problem in 2.6.23
Message-ID: <20071028115240.GA23227@lazybastard.org>
References: <023b01c81824$71647f40$5267a8c0@Jocke>
	<1193440660.16168.57.camel@shinybook.infradead.org>
	<20071027231812.GA21216@lazybastard.org>
	<1193536844.2915.36.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1193536844.2915.36.camel@shinybook.infradead.org>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 27 October 2007 22:00:44 -0400, David Woodhouse wrote:
> 
> Well, the f->dents list is _already_ ordered by the hash of the
> filename. The only reason we _don't_ use the hash as the i_pos 'cookie'
> is because of the potential for hash collisions.
> 
> If we could deal with that, we could use trees for it instead of a
> linked list.

I'd say just do it.  You are already breaking nfs as-is.  The i_pos
cookie is required to be stable across reboots.  And since you no longer
store deletion dirents on the medium, the only thing you can do is try
to use relatively robust non-standard(1) behaviour.

One way of doing that is to favor returning the same dentries twice over
not returning them at all (and try to make it a rare event, of course).
So you can just use the hash (32bit, due to nfs protocol limitations)
as a cookie and in case of hash collision, return all colliding
dentries.  Drawback: endless loop when getdents only has enough room for
a single dentry.

Second variant is Neil Browns approach of using a 24bit hash and an 8bit
sequence number.  In case of a hash collision, all colliding dentries
are kept in a list and the sequence number is used just a i_pos is used
currently for the collision chain.  Since all these structure are not
stable across reboot, you would probably want to reset the sequence
number to zero whenever seekdir is called.

(1) Non-standard behaviour is nothing unusual.  Afaiks even ext3 with
dirhash is non-standard.

Jörn

-- 
"Translations are and will always be problematic. They inflict violence
upon two languages." (translation from German)
