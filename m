Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19BdBV-0001ro-7B
	for <linux-mtd@lists.infradead.org>; Fri, 02 May 2003 17:14:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Vipin Malik <vipin@embeddedlinuxworks.com>
In-Reply-To: <5.1.0.14.0.20030502105515.02464fa8@ns.webzsite.com>
References: <00512BA4F9D3D311912A009027E9B8F407E4ED@NT>
	 <00512BA4F9D3D311912A009027E9B8F407E4ED@NT>
	 <5.1.0.14.0.20030502105515.02464fa8@ns.webzsite.com>
Message-Id: <1051892105.23448.46.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 02 May 2003 17:15:05 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: dge@sixnetio.com
cc: linux-mtd@lists.infradead.org
Subject: RE: Oops in mounting jffs2 (jffs2_get_ino_cache())
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-05-02 at 17:03, Vipin Malik wrote:
> May I humbly suggest that this is the type of info one should comment in 
> the relevant place in the code.

It's already there...

        ic = jffs2_get_ino_cache(c, ino);
        if (!ic) {
                /* Inocache get failed. Either we read a bogus ino# or it's just genuinely the
                   first node we found for this inode. Do a CRC check to protect against the former
                   case */

You might do better to humbly suggest that I actually _read_ the code
before assuming I was too stupid to get it right in the first place :)


-- 
dwmw2
