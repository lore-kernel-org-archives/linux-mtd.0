From: David Woodhouse <dwmw2@infradead.org>
To: Jun Sun <jsun@mvista.com>
In-Reply-To: <20031028182828.D30683@mvista.com>
References: <20031022182558.U19834@mvista.com>
	 <20031027101741.C1678@mvista.com>
	 <1067338214.15551.405.camel@hades.cambridge.redhat.com>
	 <20031028182828.D30683@mvista.com>
Content-Type: text/plain
Message-Id: <1067426006.15551.1546.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 29 Oct 2003 11:13:26 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-10-28 at 18:28 -0800, Jun Sun wrote:
+#if defined(CONFIG_MTD)
+       /* we use generic physmap mapping driver */
+       physmap_set_map(0x400000, 4, 0x1e000000);
+
+       physmap_add_partition("YAMON", 0x100000, 0x0, MTD_WRITEABLE);
+       physmap_add_partition("User FS", 0x300000, 0x100000, 0);
+#endif

That's nicer. Why multiple physmap_add_partition() calls rather than
just a single array passed to physmap_set_map() though?

	mtd = physmap_set_map(adr, len, width, set_vpp, partitions);

	physmap_unset_map(mtd);

-- 
dwmw2
