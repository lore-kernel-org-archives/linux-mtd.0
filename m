Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYKJ5-00069E-HK
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2016 21:15:44 +0000
Subject: Re: [PATCH] ubifs: Implement O_TMPFILE
To: Pavel Machek <pavel@ucw.cz>
References: <1456048004-20365-1-git-send-email-richard@nod.at>
 <20160223204510.GA16961@amd>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <56CCCBE4.1040809@nod.at>
Date: Tue, 23 Feb 2016 22:15:16 +0100
MIME-Version: 1.0
In-Reply-To: <20160223204510.GA16961@amd>
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

Am 23.02.2016 um 21:45 schrieb Pavel Machek:
> Hi!
> 
>> +	ui = ubifs_inode(inode);
>> +
>> +	err = ubifs_init_security(dir, inode, &dentry->d_name);
>> +	if (err)
>> +		goto out_inode;
>> +
>> +	mutex_lock(&ui->ui_mutex);
>> +	insert_inode_hash(inode);
>> +	d_tmpfile(dentry, inode);
>> +	ubifs_assert(ui->dirty);
>> +	instantiated = 1;
>> +	mutex_unlock(&ui->ui_mutex);
>> +
>> +	mutex_lock(&dir_ui->ui_mutex);
>> +	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 1, 0);
>> +	if (err)
>> +		goto out_cancel;
>> +	mutex_unlock(&dir_ui->ui_mutex);
> 
> Move the if () below unlock, and make it goto out_inode?

Yes. That's better. :)

Thanks,
//richard
