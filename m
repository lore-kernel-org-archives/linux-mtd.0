Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFQU2-0004Jx-Dl
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 19:37:44 +0000
Subject: Re: Setting ->s_dev to a char device (Was: Re: [PATCH v2] ubifs:
 allow userspace to map mounts to volumes)
To: Rabin Vincent <rabin.vincent@axis.com>, Al Viro <viro@ZenIV.linux.org.uk>
References: <1496042533-17024-1-git-send-email-rabin.vincent@axis.com>
 <6737a526-18ba-6d8c-f6c8-03f03d74b90a@nod.at>
 <20170529120818.GA6365@ZenIV.linux.org.uk> <20170529143358.GA27938@axis.com>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <4cc7a59e-18e1-c7a0-86c1-22536e0068ea@nod.at>
Date: Mon, 29 May 2017 21:37:15 +0200
MIME-Version: 1.0
In-Reply-To: <20170529143358.GA27938@axis.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rabin,

Am 29.05.2017 um 16:33 schrieb Rabin Vincent:
> On Mon, May 29, 2017 at 01:08:25PM +0100, Al Viro wrote:
>> Userspace sure as hell does.  st_dev in stat(2) is a block device number;
>> moreover, there might _be_ a block device with the same number at the same
>> time - even mounted.  Why not make ->show_options() print the currently
>> valid volume name, anyway?  That would seem to be the obvious approach...
> 
> The following patch works for me, if it's OK to show options that can't
> actually be used when mounting:

Good that this very small changes fulfils your use case. :-)
I'd accept and ignore ubi= and vol= parameters.

i.e.
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index cf4cc99b75b5..50cebbe35c38 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -931,6 +933,7 @@ enum {
 	Opt_chk_data_crc,
 	Opt_no_chk_data_crc,
 	Opt_override_compr,
+	Opt_ignore,
 	Opt_err,
 };

@@ -942,6 +945,8 @@ static const match_table_t tokens = {
 	{Opt_chk_data_crc, "chk_data_crc"},
 	{Opt_no_chk_data_crc, "no_chk_data_crc"},
 	{Opt_override_compr, "compr=%s"},
+	{Opt_ignore, "ubi=%s"},
+	{Opt_ignore, "vol=%s"},
 	{Opt_err, NULL},
 };

@@ -1042,6 +1047,8 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			c->default_compr = c->mount_opts.compr_type;
 			break;
 		}
+		case Opt_ignore:
+			break;
 		default:
 		{
 			unsigned long flag;

Thanks,
//richard
