Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HglSs-0006K1-Mo
	for linux-mtd@lists.infradead.org; Wed, 25 Apr 2007 13:39:40 -0400
Subject: Re: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177517258.2755.261.camel@pmac.infradead.org>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
	<1177515855.2755.252.camel@pmac.infradead.org>
	<1177516583.5073.22.camel@gentoo-jocke.transmode.se>
	<1177517258.2755.261.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 25 Apr 2007 19:39:34 +0200
Message-Id: <1177522774.28488.4.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-04-25 at 17:07 +0100, David Woodhouse wrote:
> I've just committed something to the git tree which should fix the
> symptoms --and I think it should apply OK to 2.6.20 which predates other
> improvements in read_inode(). 
> 
> We should still work out the _cause_ though. Once you've confirmed that
> this patch avoids the crash, you'll know the inode number (because it'll
> bitch about it). If you don't want to wait for a full
> CONFIG_JFFS2_FS_DEBUG=1 run, can you enable all the output in
> jffs2_get_inode_nodes() _just_ for that inode, and show me what nodes
> are found?

Seems to work, at least I can boot now but I get a few compliants:
Starting services: te_server JFFS2 warning: (144) jffs2_do_read_inode_internal: 
Truncating ino #6537 to 160109 bytes failed because it only had 138184 bytes to 
start with!
JFFS2 warning: (144) jffs2_do_read_inode_internal: Truncating ino #9049 to 70747
 bytes failed because it only had 65536 bytes to start with!
JFFS2 warning: (144) jffs2_do_read_inode_internal: Truncating ino #9943 to 46278
29 bytes failed because it only had 16384 bytes to start with!
JFFS2 warning: (144) jffs2_do_read_inode_internal: Truncating ino #9947 to 10240
 bytes failed because it only had 0 bytes to start with!
JFFS2 warning: (144) jffs2_do_read_inode_internal: Truncating ino #10580 to 4800
712 bytes failed because it only had 4788600 bytes to start with!
JFFS2 warning: (144) jffs2_do_read_inode_internal: Truncating ino #11246 to 4925
440 bytes failed because it only had 1717152 bytes to start with!
te_log te ntpd alib_psupd icn_server cp_cm ne_rc -initshm cp_cop cp_pbh eq_bh_su
pv eq_bh voa_main alib_swusd mgmt_named mgmt_invd eq_rh mgmt_pmd mgmt_backupd mg
mt_backup_tftpd ne_db_mgr mgmt_alarmd tosv_server tosv_supv Remove /var/net-snmp
/snmpd.conf snmpd -f -c /etc/lumentis/cuappl02a-r8a-070425_2/snmpd.conf -l /tmp/
snmpd.log  zebra ospfd sys_sysconfd sys_ipconfd aux_mgrd eq_tm_mgr eq_tgtm_mgr e
q_tgltm_mgr eq_mxm_mgr eq_gbem_mgr eq_fcm_mgr eq_qm_mgr eq_oam_mgr eq_xm_mgr eq_
fxm_mgr eq_ram_mgr eq_cpm_mgr eq_gxpm_mgr eq_qxpm_mgr eq_dtgm_mgr eq_xgbm_mgr eq
_voam_mgr eq_pbm_mgr eq_bm_mgr eq_topm_mgr eq_spfm_mgr eq_pm_mgr eq_ppp_mgr ne_s
wumd alib_memsupd ne_rc ne_rc_load ne_rc_supv pppd httpd JFFS2 warning: (316) jf
fs2_do_read_inode_internal: Truncating ino #10580 to 4800712 bytes failed becaus
e it only had 4788600 bytes to start with!
rsvpd gmpls dropbear JFFS2 warning: (316) jffs2_do_read_inode_internal: Truncati
ng ino #11246 to 4925440 bytes failed because it only had 1717152 bytes to start
 with!
JFFS2 warning: (316) jffs2_do_read_inode_internal: Truncating ino #9049 to 70747
 bytes failed because it only had 65536 bytes to start with!
Key is a DSS key
Wrote key to '/opt/appl/cuappl02a-r8a-070425_2/etc/dropbear_dss_host_key'
JFFS2 warning: (316) jffs2_do_read_inode_internal: Truncating ino #6537 to 16010
9 bytes failed because it only had 138184 bytes to start with!
JFFS2 warning: (316) jffs2_do_read_inode_internal: Truncating ino #9947 to 10240
 bytes failed because it only had 0 bytes to start with!
JFFS2 warning: (316) jffs2_do_read_inode_internal: Truncating ino #9943 to 46278
29 bytes failed because it only had 16384 bytes to start with!
Key is a RSA key
Wrote key to '/opt/appl/cuappl02a-r8a-070425_2/etc/dropbear_rsa_host_key'
GC .
Done.

Wonder how the lab manged to get that many corrupted nodes?
One thing that is rather new in our system is that we trigger GC by
sending HUP to the GC thread from a script in user space at startup and
then every 24 hours.

> 
> It sounds like some nodes have gone missing, leaving you with _only_ a
> metadata node -- with no data of its own, just other inode information
> including a non-zero i_size.
> 
