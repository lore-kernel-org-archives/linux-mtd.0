From: dwmw2@infradead.org (David Woodhouse)
Date: 24 Feb 2003 10:36:45 +0000
Subject: Root file system as CRAMFS on Flash
In-Reply-To: <002a01c2dbee$e8a7b6c0$1504060a@future.futsoft.com>
References: <002a01c2dbee$e8a7b6c0$1504060a@future.futsoft.com>
Message-ID: <1046083004.1545.32.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-02-24 at 10:24, Purushothaman N wrote:
> Dear All,
> 
> Sorry for disturbing the list again. I was successfully able to mount a
> cramfs
> image in flash with NFS as root file system. But i am facing problems with
> mounting the cramfs image as root file system. I have given the correct root
> option
> to the kernel. 

No you haven't. Turn off devfs or change it to 'root=/dev/mtdblock/2'

-- 
dwmw2
