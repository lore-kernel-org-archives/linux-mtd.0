Received: from dns.heurikon.com ([192.48.245.20] helo=frankfurter.heurikon.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Ne0c-00051h-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jul 2001 18:24:14 +0100
Message-ID: <F9102D41F595D311ACA7009027DE2C84033D4D87@c3po.heurikon.com>
From: "McNutt, Scott" <smcnutt@artesyncp.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Magic bitmask 0x1985 not found 
Date: Fri, 20 Jul 2001 12:29:50 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> From: David Woodhouse
> 
> smcnutt@artesyncp.com said:
> >  I thought I used 131072. But based on the dump, I must have
> > fat-fingered 131071 :-(. I made a new image with -e 131072 and it
> > looks good.
> 
> Er, yes, that would confuse it quite a lot. Perhaps we ought to make 
> mkfs.jffs2 reject values which aren't a power of two?
> 
Here's a quicky:

		case 'e':
            {
                unsigned int erase_mask;
                erase_block_size = strtol(optarg, NULL, 0);
                erase_mask = (unsigned)(-1)>>
                    ((sizeof(erase_block_size)<<3) - ffs(erase_block_size )
+ 1);
                if( erase_block_size & erase_mask ){
                    printf( "erase size must be power of 2\n");
                    exit(1);
                }
            }
			break;
