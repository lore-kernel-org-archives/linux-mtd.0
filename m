Date: Thu, 20 May 2004 15:23:47 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Some mailing lists: ;
Message-ID: <Pine.LNX.4.44.0405201507340.17303-100000@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Administivia -- mailing list server changes.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://mm_cfg_has_not_been_edited_to_set_host_domains/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


The mailing lists I run have now been moved from pentafluge.infradead.org 
(physically hosted in Cambridge) to canuck.infradead.org (in Ottawa).

This is because I was given 48 hours notice that pentafluge has to be 
removed from its current home. This isn't even as long as my ex-employer 
gave me when they finally suggested I might like to remove a different 
machine two _years_ after I no longer worked there. No reason has been 
given for the sudden urgency of this.

Unfortunately, the result of this is that I haven't had time to wind down 
the DNS timeouts to give a smooth changeover -- so the MX, A and AAAA 
records for 'lists.infradead.org' will continue to point to the wrong 
place in many caches until some time next week.

The MX records shouldn't matter too much -- hence mail will keep working 
-- because canuck was already listed as a backup. For access to the 
mailman interface and the archives, you may need to know in the meantime 
that its IP addresses is 2002:cde9:d907::1 (or 205.233.217.7 for those of 
you still stuck on IPv4).

Obviously the changeover hasn't been as well-planned and tested as I'd
like; please let me know if there are any problems.

The machine known as '{phoenix,cvs,www}.infradead.org' will also be made
homeless. I plan to move WWW services over to canuck some time today or
tomorrow once once I get bored of watching the mail logs for anomalies and
want something else to worry about.

A new home is being arranged, but the lead time for a DSL installation was
15 days, starting from two days ago. 

There exists a possibility that our esteemed IS folks won't _actually_
pull the plug with that little notice and reason; that they'll hear my
plea for a reasonable stay of execution while I'm waiting for the new home
to be made ready. If it _doesn't_ happen that way, then the CVS server
will probably be going IPv6-only on the wrong end of an ISDN line until
the new home is ready.

-- 
dwmw2
