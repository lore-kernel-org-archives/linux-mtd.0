Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuIAR-0006oK-CV
 for linux-mtd@lists.infradead.org; Tue, 10 Jun 2014 09:16:32 +0000
Message-ID: <5396CCA8.7060303@huawei.com>
Date: Tue, 10 Jun 2014 17:15:20 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: ubifs: replay log error
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

I meet a serious problem when I was mounting an ubifs partition in v3.10.

[  938.975707] UBIFS: background thread "ubifs_bgt0_0" started, PID 2222
[  938.992994] UBIFS: recovery needed
[  939.005971] UBIFS error (pid 2220): replay_log_leb: first log node at LEB 4:0 is not CS node
[  939.006004] UBIFS error (pid 2220): replay_log_leb: log error detected while replaying the log at LEB 4:0
[  939.006024]  magic          0x6101831
[  939.006046]  crc            0x81e22cd5
[  939.006063]  node_type      8 (reference node)
[  939.006084]  group_type     0 (no node group)
[  939.006105]  sqnum          2375337
[  939.006123]  len            64
[  939.006144]  lnum           5273
[  939.006164]  offs           122880
[  939.006181]  jhead          2
[  939.006279] UBIFS: background thread "ubifs_bgt0_0" stops

I found a similar problem fixed by commit c6727932, Do you think they are
related?

In my environment, system will be shutdown by high temperature. So the
filesystem would be unclean umount several times.

Besides, do we have some tools like fsck to re-valid the partition after
this error happen? I can't mount this partition now and format it again is
the only way I know to deal with this situation.

Thanks.

Hu
