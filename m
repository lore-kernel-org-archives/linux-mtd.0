Received: from intranet.asianux.com ([58.214.24.6])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tqxo0-00027r-Ac
 for linux-mtd@lists.infradead.org; Fri, 04 Jan 2013 03:18:48 +0000
Message-ID: <50E64A4E.7010408@asianux.com>
Date: Fri, 04 Jan 2013 11:19:42 +0800
From: Chen Gang <gang.chen@asianux.com>
MIME-Version: 1.0
To: jack@suse.cz, akpm@linux-foundation.org, adilger.kernel@dilger.ca,
 Theodore Ts'o <tytso@mit.edu>,
 jaegeuk.kim@samsung.com, dwmw2@infradead.org,
 torvalds@linux-foundation.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH v2] fs/ext*,f2fs,jffs2,reiserfs: give comments for acl
 size and count calculation
References: <50DD20B2.6040204@asianux.com> <50E646BC.2090201@asianux.com>
In-Reply-To: <50E646BC.2090201@asianux.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

于 2013年01月04日 11:04, Chen Gang 写道:
> +#define ACL_MAX_SHORT_ENTRY     (4)

 sorry,
   should use "4" instead of "(4)".
   I need send patch v3.




-- 
Chen Gang

Asianux Corporation
