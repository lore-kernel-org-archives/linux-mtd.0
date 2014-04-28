In-Reply-To: <535E7A58.8090102@monstr.eu>
References: <535E7A58.8090102@monstr.eu>
To: monstr@monstr.eu
MIME-Version: 1.0
Subject: Re: JFFS2 locking issue on 3.14 + patches
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Message-ID: <OFB4A03062.544A67D6-ONC1257CC8.005BCD5F-C1257CC8.005BF962@transmode.se>
Date: Mon, 28 Apr 2014 18:44:36 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Wang Guoli <andy.wangguoli@huawei.com>, Li Zefan <lizefan@huawei.com>,
 linux-mtd@lists.infradead.org, Ajesh Kunhipurayil Vijayan <ajesh@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"linux-mtd" <linux-mtd-bounces@lists.infradead.org> wrote on 2014/04/28 
17:57:12:

> From: Michal Simek <monstr@monstr.eu>
> To: linux-mtd@lists.infradead.org, Brian Norris 
<computersforpeace@gmail.com>, Li Zefan <lizefan@huawei.com>, Wang Guoli 
<andy.wangguoli@huawei.com>, Kamlakant Patel 
<kamlakant.patel@broadcom.com>, Ajesh Kunhipurayil Vijayan 
<ajesh@broadcom.com>, 
> Date: 2014/04/28 18:01
> Subject: JFFS2 locking issue on 3.14 + patches
> Sent by: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
> 
> Hi,
> 
> we are having this problem with JFFS2 rootfs. It is v3.14 kernel
> with these 5 patches which cherry-picked from 3.15.
> 
> 41bf1a2 jffs2: Fix crash due to truncation of csize
> 3367da5 jffs2: Fix segmentation fault found in stress test
> 01887a3 jffs2: unlock f->sem on error in jffs2_new_inode()
> 13b546d jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
> 3ead957 jffs2: remove from wait queue after schedule()
> 
> There were some discussions on mtd mailing list about these locking
> issues which are probably not resolved yet.
> 
> Here is the full branch I do use if someone is interested.
> 
http://git.monstr.eu/?p=linux-2.6-microblaze.git;a=shortlog;h=refs/heads/xilinx/master-next

> I have also attached .config file for reference.
> 
> I have tested jffs2 rootfs on previous kernel versions and it was 
working
> fine that's why I think there is no problem with jffs2 rootfs itself.
> 
> on unicpu system is less amount of CRC faults.

Wild guess, JFFS2 lacks readpages(). Perhaps you need to add it?

    Jocke
