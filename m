Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhLpr-000606-QR
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2013 16:01:32 +0000
Message-ID: <52864537.3040800@oracle.com>
Date: Sat, 16 Nov 2013 00:00:55 +0800
From: Jeff Liu <jeff.liu@oracle.com>
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 0/6] list: introduce list_last_entry_or_null()
References: <5285A33C.4040808@oracle.com>
 <20131115141100.GA17659@infradead.org>
In-Reply-To: <20131115141100.GA17659@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: jfs-discussion@lists.sourceforge.net, jiri@resnulli.us,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 "xfs@oss.sgi.com" <xfs@oss.sgi.com>, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, oleg@redhat.com, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 11/15 2013 22:11, Christoph Hellwig wrote:
> On Fri, Nov 15, 2013 at 12:29:48PM +0800, Jeff Liu wrote:
>> Hi Folks,
>>
>> This patch is trying to introduce a new list helper to retrieve the
>> last entry or return NULL if the list is empty corresponding to it,
>> which is inspired by Jiri Pirko's list_first_entry_or_null().
> 
> How did we end up with the stupid _or_null prefix there?  I think the
> functionality is useful, but the naming is way to verbose, especially
> given that a list_first_entry or list_last_entry that optimizes away
> that one check doesn't seem useful.
> Instead of encoding detailed semantics in the name a good kerneldoc
> comment is way better.
When it comes to this point, looks the name is really a bit verbose.
And yes, they have the same kernel doc to list_first_entry/list_last_entry.

But at rculist.h, we have another similar routine with this suffix, i.e,
list_fist_or_null_rcu().

Maybe we can figure out a better name and replace the existing code with it
as list_first_entry_or_null() has not yet been widely used, it mainly being
used in drivers code as per a grep against linux-next tree.
 
$ grep list_first_entry_or_null -r linux-next

./drivers/acpi/acpi_ipmi.c:		driver_data.selected_smi = list_first_entry_or_null(
./drivers/base/regmap/regmap.c:		async = list_first_entry_or_null(&map->async_free,
./drivers/base/regmap/regmap.c:		async = list_first_entry_or_null(&map->async_free,
./drivers/net/team/team.c:	port = list_first_entry_or_null(&team->port_list,
./drivers/net/ethernet/sfc/mcdi.c:		async = list_first_entry_or_null(
./drivers/net/ethernet/intel/i40e/i40e_main.c:	return list_first_entry_or_null(&vsi->mac_filter_list,
./drivers/net/vxlan.c:	rd = list_first_entry_or_null(&f->remotes, struct vxlan_rdst, list);
./drivers/of/irq.c:		desc = list_first_entry_or_null(&intc_parent_list,
./fs/xfs/xfs_trans_priv.h:	return list_first_entry_or_null(&ailp->xa_ail, struct xfs_log_item,
./net/nfc/digital_core.c:	cmd = list_first_entry_or_null(&ddev->cmd_queue, struct digital_cmd,
./net/nfc/digital_core.c:	cmd = list_first_entry_or_null(&ddev->cmd_queue, struct digital_cmd,


Thanks,
-Jeff
