Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxJ2l-0003oM-QJ
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2011 13:03:12 +0000
Received: by wwc33 with SMTP id 33so391008wwc.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Mar 2011 05:03:08 -0800 (PST)
Subject: UBIFS defaults?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Hunter Adrian (Nokia-MS/Helsinki)" <adrian.hunter@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Mar 2011 15:01:27 +0200
Message-ID: <1299675687.2741.14.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Bhavesh Parekh <bhaveshparekh1@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

currently, UBIFS checks data CRC on read by default, i.e., the
'chk_data_crc' mount option is the default one. This makes people who
apply benchmarks less happy, because they just use the defaults.

Should we make the 'no_chk_data_crc' mount option to be the default
instead? The rationale is that people who do care to read the
documentation can switch to 'chk_data_crc' if they need, and people who
do quick UBIFS evaluation will end up with faster read speed by default.

See this section for more information about the 'no_chk_data_crc' mount
option: http://www.linux-mtd.infradead.org/doc/ubifs.html#L_checksumming

Would be nice to hear UBIFS users' opinion.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
