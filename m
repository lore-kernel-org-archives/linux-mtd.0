From: "Kyungmin Park" <kmpark@infradead.org>
To: <dedekind@infradead.org>,
	<linux-mtd@lists.infradead.org>
References: <1170242892.3635.13.camel@sauron>
Subject: RE: [RFC] [PATCH] JFFS2: use MTD_OOB_AUTO
Date: Thu, 1 Feb 2007 14:15:22 +0900
Message-ID: <005801c745bf$feeccb70$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <1170242892.3635.13.camel@sauron>
Cc: 'David Woodhouse' <dwmw2@infradead.org>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> 
> Here is a patch which teaches JFFS2 to use MTD_OOB_AUTO 
> option which makes much more sense then using MTD_OOB_PLACE. 
> The original motivation was that JFFS2 does not work on 
> OneNAND which has tricky location of free bytes at OOB.
> 
> The patch was not well tested yet, just a brief test with 
> nandsim. So it is just an RFC now.

After a minor MTD_OOB_AUTO in OneNAND, it's running.

I'll check and test it more. 

I think that it changes the previous jffs2 format. it means it brakes the
jffs2 backward compatibility.
So how about adding new configuration e.g., CONFIG_JFFS2_AUTOOOB or another
approache
then user choose the oob policy (OOB_PLACE or OOB_AUTO) or runtime
dectection???
I'm not sure what is the best one

And one more.
Please re-place the 'oob_cleanmarker' initialization like this. It's almost
constant variable.
We don't need to re-init at every jffs2 mount time.

% in fs/jffs2/wbuf.c

+
+static int __init jffs2_writebuffer_init(void)
+{
+       uint32_t crc;
+
+       /* Initialize the OOB cleanmarker pattern */
+       oob_cleanmarker.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+       oob_cleanmarker.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
+       oob_cleanmarker.totlen = cpu_to_je32(8);
+       crc = crc32(0, &oob_cleanmarker, sizeof(struct jffs2_unknown_node)-
4);
+       oob_cleanmarker.hdr_crc = cpu_to_je32(crc);
+
+       return 0;
+}
+
+module_init(jffs2_writebuffer_init);

Thank you,
Kyungmin Park
