From: David Woodhouse <dwmw2@infradead.org>
To: "Teuling, Sieme" <Sieme.Teuling@echostar.com>
In-Reply-To: <C86A9402F6A07E47B2F50A302DFA9BAE044C61@alm-exch.europe.echostar.com>
References: 
	 <C86A9402F6A07E47B2F50A302DFA9BAE044C61@alm-exch.europe.echostar.com>
Content-Type: text/plain
Message-Id: <1084893013.28151.2.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 18 May 2004 16:10:13 +0100
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: patch for nand support linux-2.4.21 jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-05-18 at 08:59 -0600, Teuling, Sieme wrote:
> Ay!, I guess that means I'm looking at a fairly big merging effort, since
> using 2.4.26 is unfortunally not an option for me (we already ported 2.4.21
> to an embedded platform).

The changes from 2.4.21 to 2.4.26 should be relatively easy to merge.
Save yourself the heartache and just do it. As an added bonus you get a
kernel which isn't remotely exploitable.

> Do you guess merging the 2.4.26 mtd/jffs2 code into the 2.4.21 kernel is the
> (feasible) approach which most likely will take the least effort?, or is
> that likely just as much work as trying to merge the latest snapshot into
> the 2.4.21 kernel?

The only way you'll get it working is if you start backporting changes
in the core VFS code from 2.4.26. 

Put 2.4.21 into CVS, update the CVS tree to 2.4.26 too. Now check out
2.4.21 and apply your own patches, having made sure there's no
gratuitous whitespace noise in your changes. Then CVS update and you
should find it's fairly easy to make it work.

-- 
dwmw2
