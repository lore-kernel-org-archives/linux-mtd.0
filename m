Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CETfu-0008EP-MS
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 10:18:52 -0400
Message-ID: <41615BA7.60801@yandex.ru>
Date: Mon, 04 Oct 2004 18:18:15 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <416122A1.4060302@oktetlabs.ru>	
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>	
	<416127B7.3070505@yandex.ru>	
	<1096893242.22034.5.camel@weaponx.rchland.ibm.com>	
	<41614B2F.8060901@yandex.ru>
	<1096895892.30942.614.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096895892.30942.614.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Of course, ICPs shouldn't contain full node headers, only those 
information which is needed for the inode cache creation should be includes.

I'm imaging the following data structures for ICPs...

------------------------------------------------------------
      Regular file inode checkpoints (FICP)
------------------------------------------------------------

The FICP are represented by the following structure:

struct jffs2_raw_ficp {
     /* standard JFFS2 node header fields */
     jint32_t magic;
     jint32_t nodetype;
     jint32_t totlen;
     jint32_t hdr_crc;
     jint32_t version;  /* the checkpoint version */
     jint32_t highest_version;  /* the highest version of node, 
described by this checkpoint */
     jint32_t lowest_version;  /* the lowest version of node, described 
by this checkpoint */
     jint32_t dsize;  /* checkpoint's data size in uncompressed form */
     jint32_t ino;  /* the inode described by this checkpoint */
     jint32_t num;  /* the number of nodes, described by this checkpoint */
     uint8_t compr;  /* the checkpoint node data compression type; 
standard values are used */
     uint8_t unused[3];  /* just padding */
     jint32_t data_crc;  /* the CRC checksum of the checkpoint data */
     jint32_t node_crc;  /* the CRC checksum of the checkpoint object 
without data */
     struct jffs2_raw_ficp_entry data[0];  /* */
};

Each node, described by the FICP is represented by the following 
structure (fields are the same as in the jffs2_raw_inode structure).

struct jffs2_raw_ficp_entry {
     jint32_t offset; /* the offset in the regular file, to which the 
changes which are introduced by this node belong */
     jint32_t version; /* the node version  */
     jint32_t size; /* size of the data belonging to the node (in 
uncompressed form) */
};

------------------------------------------------------------
Directory inode checkpoints (DICP)
------------------------------------------------------------

The directory checkpoint is represented by the following structure:
struct jffs2_raw_dicp {
     /* standard JFFS2 node header fields */
     jint32_t magic;
     jint32_t nodetype;
     jint32_t totlen;
     jint32_t hdr_crc;
     jint32_t version; /* the checkpoint version */
     jint32_t highest_version; /* the lowest version of the direntry 
node, described by this checkpoint */
     jint32_t lowest_version; /* the lowest version of the direntry 
node, described by this checkpoint */
     jint32_t dsize; /* checkpoint's data size in uncompressed form */
     jint32_t ino /* the inode number of directory, which is described 
by this checkpoint */;
     jint32_t num; /* the number of direntry nodes, described by this 
checkpoint */
     uint8_t compr; /* the checkpoint node data compression type; 
standard values are used */
     uint8_t unused[3]; /* ust padding */
     jint32_t data_crc; /* the CRC checksum of the checkpoint data */
     jint32_t node_crc; /* the CRC checksum of the checkpoint object 
without data */
     struct jffs2_raw_dicp_entry data[0];
};

Each direntry node, described by the directory checkpoint is represented 
by the following structure (fields are the same as in the 
jffs2_raw_dirent structure).

struct jffs2_raw_dicp_entry {
     jint32_t ino; /* the inode number of the target file (i.e., of the 
file to which this direntry */
     jint32_t version; /* the direntry node version */
     uint8_t size; /* the direntry name length */
     uint8_t type; /* the type of the target file (the same as the type 
field in the struct */
     uint8_t name[0] /* the direntry name */
} __attribute__((packed));



----------------------------------------------------

For FICP and DICP new node type identifiers ought to be introduced. 
These identifiers are defined as:

#define JFFS2_NODETYPE_FICP \
     (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 5)

#define JFFS2_NODETYPE_DICP \
     (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 6)

----------------------------------------------------

Comments ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
