From: timwu@interepoch.com.tw (Tim Wu)
Date: Tue, 25 Mar 2003 19:24:28 +0800
Subject: not enough blocks for JFFS?
In-Reply-To: <1048558906.2922.5.camel@gobbles>
References: <3E7E6DE5.5000003@interepoch.com.tw>	 <1048483100.3593.3.camel@gobbles>	 <20030325000503.GA14469@wohnheim.fh-wedel.de>	 <3E7FBB35.1050100@interepoch.com.tw> <1048558906.2922.5.camel@gobbles>
Message-ID: <3E803C6C.60203@interepoch.com.tw>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

So, by this approach, all the data-save write operations must be done 
through this
user-space lib instead of standard UNIX file I/O, right?


Russ Dill :

>Your goals would be better served by a user-space solution from what I
>can tell. Not only would there be less code, but that code would be
>compressed in cramfs. I'm able to use 1 boot block for blob, another for
>static configuration, and the remaining two for configuration data saved
>in this way.
>
>  
>
