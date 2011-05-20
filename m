Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QNX8o-0003yg-QK
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 21:21:51 +0000
Message-ID: <4DD6DA14.9050402@wi.rr.com>
Date: Fri, 20 May 2011 16:16:04 -0500
From: Rick Johnson <rick22@wi.rr.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: read_pnode: error -22 reading pnode at XX:YYYYY
References: <4DADF9E6.9010709@wi.rr.com>	 <1303392001.2757.16.camel@localhost>
	<4DC31183.8060807@wi.rr.com> <1304706750.7222.95.camel@localhost>
In-Reply-To: <1304706750.7222.95.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


We were able to gather more debug this time when the error reoccurred. 
I thought I'd post it, just in case something jumps out.  The strange 
thing is that 'num' seems to have a value that resembles an address.  In 
the example below, num is set to 0xC72EB990.  That's been true every 
time we've seen any debug.  Maybe it doesn't mean anything.

Thanks for taking a look.

UBIFS DBG (pid 30): get_znodes_to_commit: committing 135 znodes
UBIFS DBG (pid 30): alloc_idx_lebs: need about 0 empty LEBS for TNC commit
UBIFS DBG (pid 30): ubifs_lpt_lookup_dirty: LEB 8007, free 120832, dirty 
8192, flags 48
UBIFS DBG (pid 30): ubifs_change_lp: LEB 8007, free 96256, dirty 9656, 
flags 48
UBIFS DBG (pid 30): ubifs_lpt_lookup_dirty: LEB 8007, free 120832, dirty 
8192, flags 48
UBIFS DBG (pid 30): ubifs_save_dirty_idx_lnums: found 1 dirty index LEBs
UBIFS DBG (pid 30): ubifs_save_dirty_idx_lnums: dirtiest index LEB is 
106 with dirty 39616 and free 0
UBIFS DBG (pid 30): ubifs_tnc_start_commit: number of index LEBs 2
UBIFS DBG (pid 30): ubifs_tnc_start_commit: size of index 112520
UBIFS DBG (pid 30): ubifs_lpt_start_commit:
UBIFS error (pid 30): dbg_chk_pnode: pnode num -953239152 expected 1980 
parent num 2029 iip 0
UBIFS error (pid 30): do_commit: commit failed, error -22
UBIFS warning (pid 30): ubifs_ro_mode: switched to read-only mode, error -22
