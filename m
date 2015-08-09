Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOZ1D-0000FW-VU
 for linux-mtd@lists.infradead.org; Sun, 09 Aug 2015 22:24:41 +0000
From: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To: Brian Norris <computersforpeace@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "David
 Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] JFFS2: Prevent CPU starvation during garbage collection.
Date: Sun, 9 Aug 2015 22:24:10 +0000
Message-ID: <55C7D30A.5090509@alliedtelesis.co.nz>
References: <1438749630-1656-1-git-send-email-mark.tomlinson@alliedtelesis.co.nz>
 <20150807172127.GB60523@google.com>
In-Reply-To: <20150807172127.GB60523@google.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <D48E6FC1C508B94C90D1CCBEED25C539@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have tested that this does reduce latency for other processes. In our=20
embedded system, one process tries to wake up every 1000ms using poll().=20
During JFFS2's period of scanning, it could take 2500ms before that=20
process got the CPU. After this patch, the longest I ever saw was=20
1050ms, which is much more acceptable to us.

The only question that remains is whether allowing a reschedule at this=20
point is OK to do or not. My reasoning below says that it is, but I=20
could be mistaken. I have not seen any bad behaviour while running with=20
this patch.

On 08/08/2015 05:21 AM, Brian Norris wrote:
> + David
>
> I'm not maintaining JFFS2, but if it's exceedingly obvious (this patch
> might qualify), I might take patches.
>
> On Wed, Aug 05, 2015 at 04:40:30PM +1200, Mark Tomlinson wrote:
>> The JFFS2 garbage collection checks every file on the system for correct
>> checksums and cleaning up anything that it needs to. It sleeps for 50ms
>> between each file, but within each file it remains busy.
>>
>> As far as I can tell, there is no reason to not reschedule while checkin=
g a
>> file, by putting a cond_resched() inside jfffs2_build_inode_fragtree(). =
In
>> fact, jffs2_get_inode_nodes() will call cond_resched(), which is done
>> immediately before jffs2_build_inode_fragtree().
>>
>> With this extra cond_resched() between reading file blocks, there is a
>> dramatic improvement in latency for any processes which are running duri=
ng
>> this initial garbage collection phase.
>>
>> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
>> ---
>>   fs/jffs2/readinode.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
>> index 28e0aab..78c526a 100644
>> --- a/fs/jffs2/readinode.c
>> +++ b/fs/jffs2/readinode.c
>> @@ -536,6 +536,7 @@ static int jffs2_build_inode_fragtree(struct jffs2_s=
b_info *c,
>>   				jffs2_free_tmp_dnode_info(this);
>>   			}
>>   			this =3D vers_next;
>> +			cond_resched();
>>   		}
>>   	}
>>   	return 0;
> Obligatory question: did you test this?
>
> Brian
