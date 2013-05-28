Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhEX1-0006b7-Nt
 for linux-mtd@lists.infradead.org; Tue, 28 May 2013 07:41:20 +0000
Message-ID: <1369727042.5446.112.camel@sauron.fi.intel.com>
Subject: Re: UBIFS failure & stable page writes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Date: Tue, 28 May 2013 10:44:02 +0300
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBD81@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <4BE1E71893EF1E4F9E9DD99FB4EBF0032C02EA2D44@SI-MBX02.de.bosch.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
 <1369709828.5446.89.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBD81@SI-MBX14.de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jan Kara <jack@suse.cz>, Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-05-28 at 09:07 +0200, Prins Anton (ST-CO/ENG1.1) wrote:
> We use a backport of UBIFS-2.6 (june 2012), and checked for important fixes in this area.
> 
> Is there a way to check/find if a 'root-node' is load from flash (e.g. during recovery)?
> 
> Does recovery need the 'root-node'?

I think your error was about the root inode:

"ubifs_iget: failed to read inode 1, error -2"

which is the inode of the root directory. Just like everything else, it
is stored in the index tree.

Of course the root inode is required to access the file-system. For some
reason it cannot be found. Probably if you enable all debug messages -
it may be useful.

Is this problem reproducible?

-- 
Best Regards,
Artem Bityutskiy
